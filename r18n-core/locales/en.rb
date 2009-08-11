module R18n
  module Locales
    class En < R18n::Locale
      def ordinalize(n)
        if (11..13).include?(n % 100)
          "#{n}th"
        else
          case n % 10
          when 1; "#{n}st"
          when 2; "#{n}nd"
          when 3; "#{n}rd"
          else "#{n}th"
          end
        end
      end
      
      def format_date_full(i18n, date)
        format = @data['time']['format']['full_date']
        strftime(date, format.sub('%d', ordinalize(date.mday)))
      end
    end
  end
end