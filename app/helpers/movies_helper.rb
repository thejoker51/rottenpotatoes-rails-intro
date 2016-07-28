module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  def helper_class(field)
    if (params[:query].to_s == field) then
      return 'hilite'
    else
      return nil
    end
  end
  
  def rating_check_mark(rating)  
    # puts @hash_rating
    if @hash_rating.include? rating
      return true
    else
      return false
    end
  end
end
