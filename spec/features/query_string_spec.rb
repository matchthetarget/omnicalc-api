require "rails_helper"

describe "/square/results" do
  it "should have a working RCAV." do
    visit "/square/results?input_number=9"

    expect(page.status_code).to be(200)
  end
end

describe "/square/results" do
  it "should display the input_number from the query string of the URL." do
    visit "/square/results?input_number=5"

    expect(page).to have_context(5)
  end
end

describe "/square/results" do
  it "should display the square of the input_number from the query string of the URL." do
    visit "/square/results?input_number=5"

    expect(page).to have_context(25)
  end
end

describe "/square/results" do
  it "should display the input_number and the square of the input_number in JSON." do
    visit "/square/results?input_number=7"

    json_result = { :number => 7, :square => 49 }.to_json

    expect(page).to have_context(json_result)
  end
end

describe "/random/results" do
  it "should have a working RCAV." do
    visit "/random/results"

    expect(page.status_code).to be(200)
  end
end

describe "/random/results" do
  it "should display the input_min and input_max from the query string of the URL."
end

describe "/random/results" do
  it "should display the square of the input_min and input_max from the query string of the URL."
end

describe "/random/results" do
  it "should display the input_min and input_max and the square of the input_number in JSON."
end

describe "/square_root/results" do
  it "should have a working RCAV." do
    visit "/square_root/results"

    expect(page.status_code).to be(200)
  end
end

describe "/square_root/results" do
  it "should display the input_number from the query string of the URL."
end

describe "/square_root/results" do
  it "should display the square root of the input_number from the query string of the URL."
end

describe "/square_root/results" do
  it "should display the input_number and the square root of the input_number in JSON."
end

describe "/payment/results" do
  it "should have a working RCAV." do
    visit "/payment/results"
    
    expect(page.status_code).to be(200)
  end
end

describe "/payment/results" do
  it "should display the input_apr, input_years, and input_pv from the query string of the URL." do
    visit "/payment/results?input_apr=4.10&input_years=20&input_pv=1000"
    
    expect(page).to have have_content(4.10)
    expect(page).to have have_content(20)
    expect(page).to have have_content(1000)
  end
end

describe "/payment/results" do
  it "calculates and displays the monthly payment." do
    visit "/payment/results?input_apr=4.10&input_years=20&input_pv=1000"
    
    expect(page).to have_content(6.11)
  end
end

describe "/payment/results" do
  it "calculates the correct monthly payment and displays the input_apr, input_years, input_pv and in JSON." do

    visit "/payment/results?input_apr=4.35&input_years=30&input_pv=235000"

    json_result = {
      :purchase_price => 235000,
      :percent_down => 3.5,
      :apr => 4.35,
      :years => 30,
      :monthly_payment => 1128.91
    }.to_json

    expect(page).to have_content(json_result)
  end
end
