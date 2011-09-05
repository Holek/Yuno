class Yuno < AwesomeBotFactory::Skill
  
  configure do |c|
    c.name = "Yuno"
    c.details = ""
    c.author = "holek"
    c.url = "http://abf-yuno.herokuapp.com/yuno"
    c.regex = "^(.*)(Y U NO|BUT WHEN I DO) (.+)$"
  end
  
  matches :text_1, :action, :text_2
  
  def reply
    image = "http://memecaptain.com/i?u=http%3A%2F%2Fmemecaptain.com%2F"
    case self.action.upcase
    when "Y U NO"
      image << "y_u_no.jpg"
    when "BUT WHEN I DO"
      image << "most_interesting.jpg"
    end
    image << "&tt=#{URI.encode_www_form_component(self.text_1)}" unless self.text_1.empty?
    image << "&tb=#{URI.encode_www_form_component("#{self.action} #{self.text_2}")}#jpg"

    {:type => "TextMessage", :body => image}
  end
  
end