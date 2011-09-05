class Yuno < AwesomeBotFactory::Skill
  
  configure do |c|
    c.name = "Yuno"
    c.details = ""
    c.author = "holek"
    c.url = "http://abf-yuno.herokuapp.com/yuno"
    c.regex = "yuno:(.+)"
  end
  
  matches :command, :in_your, :order, :of, :matches
  
  def reply
    { :type => "TextMessage", :body => "hello world" }
  end
  
end