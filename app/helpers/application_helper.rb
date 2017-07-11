module ApplicationHelper
  def separate_with_quote(amount, unit = '', dense: false)
    precision = (amount.to_f % 1 == 0) ? 0 : 2
    options = {
      precision: precision,
      separator: ',',
      delimiter: "'",
      unit: unit
    }
    options[:format] = '%n%u' if dense
    number_to_currency(amount || 0, options).gsub('&#39;', "\'") # HACK
  end

  def separate_integer_with_quote(amount, unit = '')
    number_to_currency(amount || 0,
                       precision: 0, separator: ',', delimiter: "'",
                       unit: unit).gsub('&#39;', "\'")
  end

  def separate_with_quote_and_currency(amount)
    separate_with_quote(amount) + ' ' + I18n.t('ruble')
  end

  def format_rate(rate)
    "%0.2f %" % [rate]
  end
end
