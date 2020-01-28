class ApplicationController < ActionController::Base

  def flex_square
    number = params.fetch("the_number").to_i
    result = {}
    result.store(:number, number)
    result.store(:square, number ** 2)
    render({ :json => result })
  end

  def flex_square_root
    number = params.fetch("the_number").to_i
    result = {}
    result.store(:number, number)
    result.store(:square_root, (number ** 0.5).to_f )

    render({ :json => result })
  end

  def flex_random
    min = params.fetch("min").to_i
    max = params.fetch("max").to_i
    result = {}
    result.store(:min, min)
    result.store(:max, max )
    random_number = rand(min..max)
    result.store(:random, random_number )
    render({ :json => result })
  end 

  def square
    number = params.fetch("input_number").to_i
    result = {}
    result.store(:number, number)
    result.store(:square, number ** 2)
    render({ :json => result })
  end
  
  def square_root
    number = params.fetch("input_number").to_i
    result = {}
    result.store(:number, number)
    result.store(:square_root, (number ** 0.5).to_f )

    render({ :json => result })
  end

  def random
    min = params.fetch("input_min").to_i
    max = params.fetch("input_max").to_i
    result = {}
    result.store(:min, min)
    result.store(:max, max )
    random_number = rand(min..max)
    result.store(:random, random_number )
    render({ :json => result })
  end

  def payments
    apr = params.fetch("input_apr").to_f
    years = params.fetch("input_years").to_i
    principal = params.fetch("input_pv").to_f

    rate_per_period = apr / 1200
    number_of_periods = years * 12
    monthly_payment = (rate_per_period * principal) / (1 - (1 + rate_per_period)**-number_of_periods)

    result = {
      :purchase_price => principal.to_i,
      :apr => apr,
      :years => years,
      :monthly_payment => monthly_payment.round(2)
    }
    render({ :json => result })
  end
end
