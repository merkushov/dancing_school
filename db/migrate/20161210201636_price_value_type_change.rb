class PriceValueTypeChange < ActiveRecord::Migration[5.0]

  # не обратимая миграция
  # при попытке вернуться к старым значениям, ошибка
  #
  #   PG::NumericValueOutOfRange: ERROR:  numeric field overflow
  #   DETAIL:  A field with precision 5, scale 2 must round to an absolute value less than 10^3.

  change_column :prices, :value, :decimal, { default: 0.0 }
    
end
