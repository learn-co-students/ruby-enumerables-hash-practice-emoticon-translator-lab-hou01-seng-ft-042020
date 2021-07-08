# require modules here
require 'yaml'
require 'pry'

def load_library(emoticons)
  # code goes here

inner_hash = {}
other_inner_hash = {}

lib = YAML::load_file(File.join(__dir__, 'emoticons.yml'))

  lib.each do |meaning, emo_arr|
    eng_emo = emo_arr[0]
    jap_emo = emo_arr[1]

    inner_hash[jap_emo] = meaning
    other_inner_hash[eng_emo] = jap_emo
  end

  lib.reject! { |k,v| k }
  lib["get_meaning"] = inner_hash
  lib["get_emoticon"] = other_inner_hash

  lib

end




def get_japanese_emoticon(emoticons, get_emoticon)
  # code goes here
  load_library(emoticons)["get_emoticon"].each do |k, v|
    if get_emoticon == k
      return v

    end

  end
"Sorry, that emoticon was not found"
end

def get_english_meaning(emoticons, get_meaning)
  # code goes here
  load_library(emoticons)["get_meaning"].each do |k, v|
    if get_meaning == k
      return v
    end
  end
  "Sorry, that emoticon was not found"
end




# inner_hash = {}
#   lib.each do |meaning, emo_arr|
#     emo_arr.each do |ele|
#       eng_emo = ele[0]
#       jap_emo = ele[1]
#
#       if !inner_hash[jap_emo]
#         inner_hash[jap_emo] = meaning
#       else inner_hash[jap_emo] = meaning
#       end
#
#     end
#   end
#
# inner_hash
