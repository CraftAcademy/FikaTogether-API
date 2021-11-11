Participant.find_or_create_by(name: 'Fraser Hughes', email: 'fraser@ft.se',
                              start_date: DateTime.parse('09/01/2009 17:00'), management: true, department: 'HR', seniority: 3)
Participant.find_or_create_by(name: 'Max Anderson', email: 'max@ft.se', start_date: DateTime.parse('09/01/2009 17:00'),
                              management: true, department: 'Admin', seniority: 3)
Participant.find_or_create_by(name: 'Dorian Buck', email: 'dorian@ft.se',
                              start_date: DateTime.parse('09/01/2009 17:00'), management: true, department: 'Development', seniority: 3)
Participant.find_or_create_by(name: 'August Enhager', email: 'august@ft.se',
                              start_date: DateTime.parse('09/01/2009 17:00'), management: false, department: 'C-Suite', seniority: 3)
