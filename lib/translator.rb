# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  # code goes here
  emoticons = {}
  emoticons_loaded = YAML.load_file(file_path)

  emoticons_loaded.each do |english_key, value_array| #looping thru the main hash
#   binding.pry
    emoticons[english_key.to_s] = {
        :english => value_array[0],
        :japanese => value_array[1]
        }
    end
return emoticons
end


def get_japanese_emoticon(file_path, english_emoticon)
  # code goes here
  japanese_emoticon = "Sorry, that emoticon was not found"
  emoticons = load_library(file_path)
  emoticons.each do |key, value|
    value.each do |language,sign|
      if language.to_s == "english"
          if sign == english_emoticon
            japanese_emoticon = emoticons[key][:japanese]
          end
      end
    end
  end
return japanese_emoticon

end




def get_english_meaning(file_path, japanese_emoticon)
  # code goes here

  english_emoticon = "Sorry, that emoticon was not found"
  emoticons = load_library(file_path)
  emoticons.each do |key, value|
    value.each do |language,sign|
      if language.to_s == "japanese"
          if sign == japanese_emoticon
            english_emoticon = key
          end
      end
    end
  end
return english_emoticon

end



#
#   japanese_emoticon = "Sorry, that emoticon is not found."
#   emoticons =  load_library(file_path)
#   emoticons.each do |key, value|
#     value.each do |language,sign|
#       if language.to_s == "english"
#         japanese_emoticon = sign.to_s
#       end
#     end
# return japanese_emoticon
# end
