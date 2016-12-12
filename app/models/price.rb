class Price < ApplicationRecord

  # TODO: тут нужна валидация полей в зависимости от выбранных элементов
  #   Например, если выбран visit_limit_type == "visits_number" то должно
  #   быть значение в поле visit_number

  validates :name,              presence: true
  validates :value,             presence: true
  validates :period_start_type, presence: true
  validates :period_end_type,   presence: true
  validates :visit_limit_type,  presence: true

  has_and_belongs_to_many :class_types, join_table: "prices_class_types"
  has_and_belongs_to_many :locations,   join_table: "prices_locations"
  has_and_belongs_to_many :users

  # справочник для поля prices.period_start_type
  # тип начала периода посещений
  # TODO: возможно, стоит перенести в отдельную таблицу
  #       т.к. трудно поддерживать целостность данных
  PERIOD_START_TYPE = [
    { 'name' => 'sale',                 'label' => 'Момент продаж' },
    { 'name' => 'first_visit',          'label' => 'Первое посещение' },
    { 'name' => 'fix_date',             'label' => 'Фиксированная дата' },
    { 'name' => 'start_week_current',   'label' => 'Начало недели (текущей)' },
    { 'name' => 'start_month_current',  'label' => 'Начало месяца (текущего)' },
    { 'name' => 'start_quarter_current','label' => 'Начало квартала (текущего)' },
    { 'name' => 'start_year_current',   'label' => 'Начало года (текущего)' },
    { 'name' => 'start_week_next',      'label' => 'Начало недели (следующей)' },
    { 'name' => 'start_month_next',     'label' => 'Начало месяца (следующего)' },
    { 'name' => 'start_quarter_next',   'label' => 'Начало квартала (следующего)' },
    { 'name' => 'start_year_next',      'label' => 'Начало года (следующего)' },
  ]

  # справочник для поля prices.period_end_type
  # тип конца периода посещений
  PERIOD_END_TYPE = [
    { 'name' => 'fix_days',           'label' => 'Дней прошедших с начала периода' },
    { 'name' => 'fix_date',           'label' => 'Фиксированная дата' },
    { 'name' => 'end_week_current',   'label' => 'Конец недели (текущей)' },
    { 'name' => 'end_month_current',  'label' => 'Конец месяца (текущего)' },
    { 'name' => 'end_quarter_current','label' => 'Конец квартала (текущего)' },
    { 'name' => 'end_year_current',   'label' => 'Конец года (текущего)' },
    { 'name' => 'end_week_next',      'label' => 'Конец недели (следующей)' },
    { 'name' => 'end_month_next',     'label' => 'Конец месяца (следующего)' },
    { 'name' => 'end_quarter_next',   'label' => 'Конец квартала (следующего)' },
    { 'name' => 'end_year_next',      'label' => 'Конец года (следующего)' },
  ]

  # справочник для поля prices.visit_limit_type
  # тип лимита посещений
  VISIT_LIMIT_TYPE = [
    { 'name' => 'visits_number',  'label' => 'Количество посещений' },
    { 'name' => 'hours_number',   'label' => 'Количество часов' },
    { 'name' => 'unlimited',      'label' => 'Безлимит' },
  ]

  # методы объекта
  # используются для генерации форм

  def self.period_start_type_option_tag_array
    option_array = []
    PERIOD_START_TYPE.each do |item|
      option_array.push([ item['label'], item['name'] ])
    end
    return option_array
  end

  def self.period_end_type_option_tag_array
    option_array = []
    PERIOD_END_TYPE.each do |item|
      option_array.push([ item['label'], item['name'] ])
    end
    return option_array
  end

  def self.visit_limit_type_option_tag_array
    option_array = []
    VISIT_LIMIT_TYPE.each do |item|
      option_array.push([ item['label'], item['name'] ])
    end
    return option_array
  end

  before_save do
    if !self.status?
      self.status = 'archive'
    end
  end

end
