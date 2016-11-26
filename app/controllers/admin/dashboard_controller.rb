class Admin::DashboardController < Admin::BaseController
  def index

    # количество зарегистрированных учеников
    @customer_count = Customer.count

    # количество постоянных учеников
    # Постоянный ученик посетил больше 2х занятий
    customer_regular_visits_result = Visit.find_by_sql("
      select count(*) as count_all
      from (
        select customer_id, count(id)
        from
          visits
        group by
          customer_id
        having count(id) > 2
      ) as a"
    )
    @customer_regular_count = customer_regular_visits_result[0]['count_all']

    # заработанная сумма
    @earned = Visit
      .joins(:class_schedule)
      .where({is_paid: true}).sum("class_schedules.cost")

    # количество проведённых занятий
    real_classes_result = Visit.find_by_sql("
      select
        round(
          sum(
            EXTRACT(EPOCH FROM cs.date_end - cs.date_begin
          )/3600)::Integer,
        1) as date_diff
      from
        (
          select distinct(class_schedule_id)
          from visits
          where is_paid=true
        ) as v 
        left join class_schedules cs on v.class_schedule_id=cs.id
    ")
    @class_minutes_count = real_classes_result[0]['date_diff']

  end
end
