gem "minitest"
require 'minitest/autorun'
require 'blabber'

class TestBlabber < MiniTest::Test

    class Log
      def set_data(data)
        @data = data
      end

      def get_data
        return @data
      end

      def reset_data
        @data = nil
      end
    end

    def test_simple

      log1 = Log.new
      log2 = Log.new

      blabber = Blabber::Blabber.new([
        {'channel' => 'Blabber::Console', 'loglevels' => ['ERROR', 'DEBUG', 'WHATWHAT']},
        {'channel' => 'Blabber::Mock', 'loglevels' => ['ERROR', 'DEBUG'], 'log' => log1},
        {'channel' => 'Blabber::Mock', 'loglevels' => ['ERROR', 'NOTDEBUG'], 'log' => log2}
      ])

      blabber.debug("debug msg")
      assert(!log1.get_data.nil?)
      assert(log2.get_data.nil?)

      log1.reset_data
      log2.reset_data

      blabber.error("error msg")
      assert(!log1.get_data.nil?)
      assert(!log2.get_data.nil?)

      log1.reset_data
      log2.reset_data

      blabber.whatwhat("whatwhat msg")
      assert(log1.get_data.nil?)
      assert(log2.get_data.nil?)

    end

end
