class Yuno < AwesomeBotFactory::Skill
  
  configure do |c|
    c.name = "Yuno"
    c.details = ""
    c.author = "holek"
    c.url = "http://abf-yuno.herokuapp.com/yuno"
    c.regex = "^(.*)Y U NO (.+)$"
  end
  
  matches :name, :action
  
  def reply
    image = "http://memecaptain.com/i?u=http%3A%2F%2Fmemecaptain.com%2Fy_u_no.jpg"
    image << "&tt=#{URI.encode_www_form_component(self.name)}" unless self.name.empty?
    image << "&tb=#{URI.encode_www_form_component("Y U NO #{self.action}")}#jpg"

    {:type => "TextMessage", :body => image}
  end
  
end