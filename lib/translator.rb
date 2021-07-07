# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
emoticons= YAML.load_file(file_path)
hash={"get_meaning":{},
  "get_emoticon":{}}
  
emoticons.each_pair do |key,value| 
    value.each do |emot| 
  if !hash[:get_meaning][emot]
  hash[:get_meaning][value[1]]=key 
  end 
  if !hash[:get_emoticon][emot]
    hash[:get_emoticon][value[0]]=value[1]
  end 
end 
end  
hash 
end 

def get_japanese_emoticon(file_path, emoticon)
if load_library(file_path)[:get_emoticon][emoticon] 
 load_library(file_path)[:get_emoticon][emoticon] 
else 
  "Sorry, that emoticon was not found"
end 
end 

def get_english_meaning(file_path, emoticon)
 if load_library(file_path)[:get_meaning][emoticon] 
 load_library(file_path)[:get_meaning][emoticon] 
else 
  "Sorry, that emoticon was not found"
end 
end 

 

# def nyc_pigeon_organizer(data)
#   new_hash={}
# data.each_pair do |attribute,attribute_value|
#     attribute_value.each_pair do |next_key,next_value|
#       next_value.each do |name| 
#         if !new_hash[name]
#           new_hash[name]={}
#         end 
#         if !new_hash[name][attribute]
#           new_hash[name][attribute]=[]
#         end 
#         new_hash[name][attribute] << "#{next_key}" 
#       end 
#     end 
#   end 
#   new_hash
# end 
