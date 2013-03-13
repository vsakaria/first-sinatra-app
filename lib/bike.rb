class Bike
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :broken,     Boolean

  def initialize
    @broken = false
  end

  # def broken?
  #   @broken
  # end

  def break!
    broken = true  
    self
  end

  def fix!
    broken = false
    self
  end

  def to_s
    "Id: #{id}, #{broken? ?  'This bike is unavailable as its broken':  'Available'}"

  end
end

# <ul>
# <% bike.each do |bike| %>
#   <li><%= h bike.inspect %></li>
# <% end %>
# </ul> 