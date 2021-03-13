module RP1
  class Persistence
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def redis(&block)
      if redis_connection.respond_to?(:with)
        redis_connection.with do |connection|
          yield connection
        end
      else
        yield redis_connection
      end
    end

    def save(object)
      redis do |connection|
        persist_object(connection, object)
      end
      object
    end

    def find(clazz, id)
      clazz.new(retrieve_object(clazz.redis_key(id)))
    end

    def delete(clazz, id)
      redis do |connection|
        connection.del(clazz.redis_key(id))
      end
    end

    private

    def redis_connection
      configuration.redis_connection
    end

    def persist_object(connection, object)
      connection.multi do |multi|
        redis_key = object.class.redis_key(object.id)
        object.attributes.values.each do |attribute|
          name = attribute.name
          value = attribute.coerce_result(object.public_send(name))
          if value.nil?
            multi.hdel(redis_key,
                       name)
          else
            multi.hset(redis_key,
                       name,
                       value)
          end
        end
      end
    end

    def retrieve_object(key)
      redis do |connection|
        connection.hgetall(key)
      end
    end
  end
end
