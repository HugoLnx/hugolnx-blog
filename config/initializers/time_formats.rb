# encoding: utf-8
MONTHNAMES_IN_PORTUGUESE = [nil] + %w{Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro}
Date::DATE_FORMATS[:portuguese] = lambda{|date| date.strftime("%Y, %d de #{MONTHNAMES_IN_PORTUGUESE[date.month]}")}
