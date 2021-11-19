Participant.find_or_create_by(name: 'Fraser Hughes', email: 'fraser@ft.se',
                              start_date: DateTime.parse('09/01/2009 17:00'), management: true, seniority: 3, fika_score: 25).update(department: Department.find_by(name: 'Marketing'))
Participant.find_or_create_by(name: 'Max Anderson', email: 'max@ft.se', start_date: DateTime.parse('09/01/2009 17:00'),
                              management: true, seniority: 3, fika_score: 16).update(department: Department.find_by(name: 'Human Resources'))
Participant.find_or_create_by(name: 'Dorian Buck', email: 'dorian@ft.se',
                              start_date: DateTime.parse('09/01/2009 17:00'), management: true, seniority: 3, fika_score: 31).update(department: Department.find_by(name: 'Finance'))
Participant.find_or_create_by(name: 'August Enhager', email: 'august@ft.se',
                              start_date: DateTime.parse('09/01/2009 17:00'), management: false, seniority: 3, fika_score: 19).update(department: Department.find_by(name: 'Sales'))
Participant.find_or_create_by(name: 'Thomas Ochman', email: 'Thomas@craft.se',
                              start_date: DateTime.parse('09/01/2009 17:00'), management: false, seniority: 3, fika_score: 9).update(department: Department.find_by(name: 'Information Technology'))
Participant.find_or_create_by(name: 'Oliver Ochman', email: 'Oliver@craft.se',
                              start_date: DateTime.parse('09/01/2009 17:00'), management: false, seniority: 3, fika_score: 21).update(department: Department.find_by(name: 'Information Technology'))
