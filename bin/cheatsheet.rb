#!/usr/bin/env ruby

CHEATSHEET_DIR = "#{Dir.home}/.cheatsheets"

SHEET = input.gets

cheatsheet = File.open("#{CHEATSHEET_DIR}/#{SHEET}", "r")

reader = ->line { puts line }

cheatsheet.each_line &reader
