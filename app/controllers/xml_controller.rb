class XmlController < ApplicationController
  def index
    unless is_numeric? params[:val] and params[:val].to_i.positive?
      result = []
      return count = 0
    end
    val = params[:val].to_i
    count = 1
    res = [ [count, 1, 1] ]
    2.upto(val) do |num|
      if palindrome? (num**2)
        res.push [count += 1, num, num**2]
      end
    end
    @result = res
    @count = count
    data = res.map { |val| {iter: val[0], num: val[1], squared: val[2]} }
    respond_to do |format|
      format.xml { render xml: data.to_xml }
      format.rss { render xml: data.to_xml }
    end
  end

  private 
  def palindrome? num
    num == num.to_s.reverse.to_i
  end

  def is_numeric? obj 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
 end
end
