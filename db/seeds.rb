Message.delete_all

100.times do |n|
  Message.create \
    sender: 'bob',
    receiver: 'alice',
    content: "message #{n}"
end

100.times do |n|
  Message.create \
    sender: 'alice',
    receiver: 'bob',
    content: "message #{n}"
end
