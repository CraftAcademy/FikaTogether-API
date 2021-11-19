Fika.find_or_create_by(
  id: 1001,
  start_date: DateTime.parse('13/11/2021 13:00'),
  end_date: DateTime.parse('13/11/2021 13:30'),
  similarity: 0.8024069261575878
).update(participants: [Participant.find_by(name:"Fraser Hughes"), Participant.find_by(name:"Max Anderson")])

Fika.find_or_create_by(
  id: 1002,
  start_date: DateTime.parse('13/11/2021 13:00'),
  end_date: DateTime.parse('13/11/2021 13:30'),
  similarity: 0.1065972861575878
).update(participants: [Participant.find_by(name:"Dorian Buck"), Participant.find_by(name:"August Enhager")])

Fika.find_or_create_by(
  id: 1003,
  start_date: DateTime.parse('13/11/2021 13:00'),
  end_date: DateTime.parse('13/11/2021 13:30'),
  similarity: 0.692613673575878
).update(participants: [Participant.find_by(name:"Fraser Hughes"), Participant.find_by(name:"August Enhager")])

Fika.find_or_create_by(
  id: 1004,
  start_date: DateTime.parse('17/11/2021 13:00'),
  end_date: DateTime.parse('17/11/2021 13:30'),
  similarity: 0.346739261575878
).update(participants: [Participant.find_by(name:"Fraser Hughes"), Participant.find_by(name:"Dorian Buck")])

Fika.find_or_create_by(
  id: 1005,
  start_date: DateTime.parse('17/11/2021 13:00'),
  end_date: DateTime.parse('17/11/2021 13:30'),
  similarity: 0.4035669261575878
).update(participants: [Participant.find_by(name:"Dorian Buck"), Participant.find_by(name:"Max Anderson")])

Fika.find_or_create_by(
  id: 1006,
  start_date: DateTime.parse('17/11/2021 13:00'),
  end_date: DateTime.parse('17/11/2021 13:30'),
  similarity: 0.2346165785975878
).update(participants: [Participant.find_by(name:"August Enhager"), Participant.find_by(name:"Max Anderson")])

