require 'coveralls'
Coveralls.wear!
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

      test1_msg = "debug msg"
      blabber.debug(test1_msg)
      assert(!log1.get_data.nil?)
      assert(log2.get_data.nil?)
      assert_equal(test1_msg,log1.get_data["message"])

      log1.reset_data
      log2.reset_data

      test2_msg = "error msg"
      blabber.error(test2_msg)
      assert(!log1.get_data.nil?)
      assert(!log2.get_data.nil?)
      assert_equal(test2_msg,log1.get_data["message"])
      assert_equal(test2_msg,log2.get_data["message"])

      log1.reset_data
      log2.reset_data

      test3_msg = "whatwhat msg"
      blabber.whatwhat(test3_msg)
      assert(log1.get_data.nil?)
      assert(log2.get_data.nil?)

    end

end
