Department.find_by(name: 'Sales').update(participants: [Participant.find_by(name:"August Enhager")])
Department.find_by(name: 'Marketing').update(participants: [Participant.find_by(name:"Fraser Hughes")])
Department.find_by(name: 'Finance').update(participants: [Participant.find_by(name:"Dorian Buck")])
Department.find_by(name: 'Human Resources').update(participants: [Participant.find_by(name:"Max Anderson")])
Department.find_by(name: 'Information Technology').update(participants: [Participant.find_by(name:"Thomas Ochman"), Participant.find_by(name:"Oliver Ochman")])