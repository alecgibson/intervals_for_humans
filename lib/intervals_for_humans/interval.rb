class IntervalsForHumans::Interval
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
    @date_counter = start_date
  end

  def components
    @components ||= {
      year: advance_years!,
      month: advance_months!,
      day: advance_days!,
    }
  end

  def to_s
    @to_s ||= begin
      components
        .each_pair
        .select { |(_key, value)| value.positive? }
        .map { |(key, value)| "#{value} #{key}#{'s' if value > 1}" }
        .join(", ")
    end
  end

private

  def advance_years!
    advance! do |date, years|
      date >> years * 12
    end
  end

  def advance_months!
    advance! do |date, months|
      date >> months
    end
  end

  def advance_days!
    advance! do |date, days|
      date + days
    end
  end

  def advance!
    initial_date = @date_counter
    advance_value = 0

    loop do
      previous_date = @date_counter
      @date_counter = yield(initial_date, advance_value + 1)

      if @date_counter > @end_date
        @date_counter = previous_date
        break
      end

      advance_value += 1
    end

    advance_value
  end
end
