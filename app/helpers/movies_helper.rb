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
end
