json.array! @events do |event|
  json.id event.id
  json.title event.title
  json.body event.body
  json.start event.start
  json.end event.end
  json.allDay event.allDay
end