require "intervals_for_humans"
require "date"

RSpec.describe IntervalsForHumans::Interval, "#to_s" do
  [
    { from: "1 Jan 2000", to: "1 Jan 2001", returns: "1 year"},
    { from: "1 Jan 2000", to: "1 Jan 2002", returns: "2 years"},
    { from: "1 Jan 2000", to: "1 Jan 2012", returns: "12 years"},
    { from: "1 Jan 2000", to: "1 Feb 2000", returns: "1 month"},
    { from: "1 Jan 2000", to: "1 Apr 2000", returns: "3 months"},
    { from: "1 Jan 2000", to: "1 Apr 2001", returns: "1 year, 3 months"},
    { from: "1 Jan 2000", to: "1 Oct 2005", returns: "5 years, 9 months"},
    { from: "1 Jan 2000", to: "2 Jan 2000", returns: "1 day"},
    { from: "1 Jan 2000", to: "31 Jan 2000", returns: "30 days"},
    { from: "1 Jan 2000", to: "7 Sep 2004", returns: "4 years, 8 months, 6 days"},
    { from: "31 Jan 2000", to: "29 Feb 2000", returns: "1 month" },
    { from: "31 Jan 2000", to: "30 Apr 2000", returns: "3 months"},
    { from: "31 Jan 2000", to: "1 May 2000", returns: "3 months, 1 day"},
    { from: "29 Feb 2000", to: "28 Feb 2001", returns: "1 year"},
    { from: "29 Feb 2000", to: "1 Mar 2001", returns: "1 year, 1 day"},
    { from: "29 Feb 2000", to: "29 Feb 2004", returns: "4 years"},
    { from: "28 Feb 2000", to: "28 Feb 2001", returns: "1 year" },
    { from: "28 Feb 2000", to: "28 Feb 2004", returns: "4 years" },
    { from: "28 Feb 2000", to: "29 Feb 2004", returns: "4 years, 1 day" },
    { from: "28 Feb 2001", to: "28 Feb 2004", returns: "3 years" },
    { from: "28 Feb 2001", to: "29 Feb 2004", returns: "3 years, 1 day" },
    { from: "1 Jan 2000", to: "1 Jan 2000", returns: ""},
    { from: "1 Jan 2000", to: "1 Jan 1999", returns: ""},
  ].each do |test_case|
    context "between #{test_case[:from]} and #{test_case[:to]}" do
      it "returns '#{test_case[:returns]}'" do
        start_date = Date.parse(test_case[:from])
        end_date = Date.parse(test_case[:to])
        interval = IntervalsForHumans::Interval.new(start_date, end_date)
        expect(interval.to_s).to eq(test_case[:returns])
      end
    end
  end
end
