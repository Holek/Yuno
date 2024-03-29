class Yuno < AwesomeBotFactory::Skill

  configure do |c|
    c.name = "Yuno"
    c.details = ""
    c.author = "holek"
    c.url = "http://abf-yuno.herokuapp.com/yuno"
    c.regex = "^(NOT SURE IF|YO DAWG|)(.*)((DOUBLE THE|Y U NO|BUT WHEN I DO| OR|ALL THE|SO|YO DAWG) (.+)| ON THE MOO+N| HAS BEEN DOUBLED)$"
  end

  matches :prepend, :text_1, :text_rest, :action, :text_2

  def reply
    case self.prepend
    when "NOT SURE IF"
      if self.action == "OR"
        image = "http://memecaptain.com/i?u=http%3A%2F%2Fs3.amazonaws.com%2Fkym-assets%2Fphotos%2Fimages%2Foriginal%2F000%2F131%2F399%2Ffry.PNG%3F1307468855&tt=#{URI.encode_www_form_component("#{self.prepend} #{self.text_1}")}&tb=#{URI.encode_www_form_component("#{self.action} #{self.text_2}")}"
      end
    when "YO DAWG"
      image = "http://memecaptain.com/i?u=http%3A%2F%2F2.bp.blogspot.com%2F-VdG-cMb7IBo%2FTb3aSReMhVI%2FAAAAAAAAAHY%2F0i-RZfYYRkY%2Fs1600%2FXzibit.png&tt=#{URI.encode_www_form_component("#{self.prepend} #{self.text_1}")}&tb=#{URI.encode_www_form_component("#{self.action} #{self.text_2}")}"
    else
      case self.action
      # My Little Pony Princess Luna gag
      when "DOUBLE THE"
        image = "http://memecaptain.com/i?u=https%3A%2F%2Fimg.skitch.com%2F20120222-jfx4k9ydn7xum58wwuea85k9r6.png"
        image << "&tb=#{URI.encode_www_form_component(self.body)}"
      # Y U NO rage guy
      when "Y U NO"
        image = "http://memecaptain.com/i?u=http%3A%2F%2Fmemecaptain.com%2Fy_u_no.jpg"
        image << "&tt=#{URI.encode_www_form_component(self.text_1)}" unless self.text_1.empty?
        image << "&tb=#{URI.encode_www_form_component("#{self.action} #{self.text_2}")}"
      # The Most Interesting Man
      when "BUT WHEN I DO"
        image = "http://memecaptain.com/i?u=http%3A%2F%2Fmemecaptain.com%2Fmost_interesting.jpg"
        image << "&tt=#{URI.encode_www_form_component(self.text_1)}" unless self.text_1.empty?
        image << "&tb=#{URI.encode_www_form_component("#{self.action} #{self.text_2}")}"
      # X all the Y
      # (including Princess Luna DOUBLE ALL THE Y's)
      when "ALL THE"
        if /DOUBLE/.match(self.text_1)
          image_url = "https%3A%2F%2Fimg.skitch.com%2F20120327-qsp9h5rwsnfcgqsim38muffxgw.png"
        elsif self.text_2[-1,1] == '?'
          image_url = "http%3A%2F%2Fmemecaptain.com%2Fall_the_things2.jpg"
        else
          image_url = "http%3A%2F%2Fmemecaptain.com%2Fall_the_things.jpg"
        end
        image = "http://memecaptain.com/i?u=#{image_url}&tt=#{URI.encode_www_form_component(self.body)}"
      # Xzibit
      when "YO DAWG"
        if self.text_1.empty? # There should be nothing before "YO DAWG"
          image = "http://memecaptain.com/i?u=http%3A%2F%2F2.bp.blogspot.com%2F-VdG-cMb7IBo%2FTb3aSReMhVI%2FAAAAAAAAAHY%2F0i-RZfYYRkY%2Fs1600%2FXzibit.png&tb=#{URI.encode_www_form_component(self.body)}"
        end
      end
      if image.nil?
        # Princess Trollestia Moooooooooon meme!
        if /^ ON THE MOO+N$/.match(self.text_rest)
          image = "http://memecaptain.com/i?u=https%3A%2F%2Fimg.skitch.com%2F20111022-d7g6w38mrwd5wjsmigqe61pjq4.png"
          image << "&tt=#{URI.encode_www_form_component(self.text_1)}" unless self.text_1.empty?
          image << "&tb=#{URI.encode_www_form_component(self.text_rest.strip)}"
        # Princess Luna has been doubled meme
        elsif /^ HAS BEEN DOUBLED$/.match(self.text_rest)
          image = "http://memecaptain.com/i?u=https%3A%2F%2Fimg.skitch.com%2F20120222-jfx4k9ydn7xum58wwuea85k9r6.png"
          image << "&tb=#{URI.encode_www_form_component("#{self.text_1} #{self.text_rest.strip}")}"
        end
      end
    end

    image << "#jpg" if image
    {:type => "TextMessage", :body => image || ""}
  end

end
