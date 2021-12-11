import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/mission.dart';

const DUMMY_MISSIONS = const [
  Mission(image: 'assets/1.png', missiondata: {
    'badge': 'Roaming badge',
    'obj': [
      [
        'Prepares a list of the equipment necessary to carry out a cell output.',
        'Prepares a report on a trip or a trip to another city is prepared with pictures.',
        'Participates in a cellular trip in which he travels at least 4 km on foot.',
        'Prepares a special notebook for scouting trips and camps.'
      ],
      [
        'Participates in a regional research with its vanguard members, with a detailed report presented, supported by pictures',
		'Participates in a cellular trip for at least one night, covering 6 km on foot',
		'Prepare a cellular trip report with photos',
		'Searches for a map of Tunisia in detail and the most important characteristics of the states'
      ],
      [
        'Prepares a detailed program for a cellular outing for at least two nights: an art program, a food program, a big game',
		'Participates in a cellular trip for at least two nights, covering 12 km on foot, interspersed with a regional research and a major game',
		'Prepare a report of the cellular trip, accompanied by pictures, with the preparation of a map of the camping center and the use of road signs',
		'He does research on the world map and the most important characteristics of countries'
      ]
    ]
  }),
  Mission(image: 'assets/2.png', missiondata: {
    'badge': 'Observer badge',
    'obj': [
      [
        'Provides a written report on his activity, including a full description of the persons involved',
		'Describes the camping location accurately',
		'An exercise about memory that reviews 24 of the 30 things presented in front of it for one minute',
		'You can distinguish 8 different sounds from among the 10 sounds he listens to'
      ],
      [
        'Provides a written report on the existing buildings, shops and doors in a cellular walk',
		'Mentions the name, description and features of a person who visited the band in an activity for the first time',
		'Distinguish 8 wrapped objects by smell and touch from a total of 10 objects',
		'He is fluent in using a camera and taking distinctive pictures that show the accuracy of his observation'
      ],
      [
        'Accurately describe the route to the camping site with the timing of each stop',
		'Describes precisely the people he encounters on the way to the camping site',
		'Can estimate the weights of 5 things so that the error rate does not exceed 10 percent',
		'It is a video that accurately describes the stages of the last week of the camp, with a focus on the most important stations in it'
      ]
    ]
  }),
  Mission(image: 'assets/3.png', missiondata: {
    'badge': 'Eco badge',
    'obj': [
      [
        'Prepares a research on the meaning of nature conservation',
		'It is a record that includes pictures and descriptions of some animals and plants in their natural surroundings',
		'Uses some waste to make useful things',
		'Participate in the campaign of trees and planting plants'
      ],
      [
        'Explains the impact of the environment on humans, animals and plants',
		'Prepares a report on the environmental environment of a cellular output',
		'Prepares a file that includes a number of flowers, plants and weeds, and mentions their names, characteristics and benefits',
		'Participate in a campaign to take care of plants and trees'
      ],
      [
        'Analyzes the meaning of pollution, its types and sources, and how to reduce its risks',
		'He mentions 4 manifestations of misuse of the scout for nature and ways to avoid it',
		'It is a research on raising a pet showing how to take care of it, its nature, methods of feeding it and the environment in which it lives',
		'Participate in an environmental campaign in the camp center, pruning trees, uprooting parasitic weeds, cleaning a stream or filling a stagnant water pool...'
      ]
    ]
  }),
  Mission(image: 'assets/4.png', missiondata: {
    'badge': 'Paramedic badge',
    'obj': [
      ['Prepares research on the importance of first aid in a scouting trip',
      'Prepares a list of the necessary contents of the Vanguard First Aid Kit and Personal First Aid Kit',
      'Methods of first aid from exposure to bruises or scratches',
      'Methods of first aid for a person exposed to a fever, animal bite, or poisonous insect bite'],
      [
      	'First aid methods for nosebleeds (epistaxis)',
		'He knows the types of wounds and burns, and the methods of first aid for all these cases',
		'Masters how to bandage and use a bandage',
		'Participates with his vanguard members in a white training course or process'
      ],
      [
      	'Explains the causes of fainting and first aid methods',
		'Explains the types of bleeding and how to stop it and mentions the main pressure points',
		'Identifying cases of joint sprains and fractures and ways to treat each of them',
		'Making a stretcher to carry an infected person using what is available in nature'
      ]
    ]
  }),
  Mission(image: 'assets/5.png', missiondata: {
    'badge': 'Roaming badge',
    'obj': [
      			[
      				'He mentions the types of fire, explains their characteristics, and prepares models and models for them',
					'Enumerates the ways of hanging cooking utensils over the stove and prepares models and models for them',
					'Prepares a lunch table in a camp (preparing the necessary tools, distributing food to individuals)',
					'He prepares a complete lunch in a cellar using a stove of his own making'
      			],
      			[
	      			'Mentions the types of stoves, explains their characteristics, and prepares models and models for them',
					'Mentions the foodstuffs that can be stored and the conditions to be observed in the store and storage',
					'He prepares a complete dinner in a private place using a stove of his own making',
					'Able to clean, maintain and save cooking utensils after use'
      			],
      			[
      				'He mentions the types of ovens, explains their characteristics, and prepares models and models for them',
					'Research on nutritional balance and the necessary nutrients for the body, with the preparation of a food program for the last week of camp, with an estimate of the cost',
					'He prepares a meal for his vanguard members using an oven of his own making',
					'He is able to dispose of waste in a proper manner and takes into account the conditions of safety, health and the environment'
      			]
    ]
  }),
  Mission(image: 'assets/6.png', missiondata: {
    'badge': 'Roaming badge',
    'obj': [
      			[
      				'Explains the importance of tracing and its techniques',
					'Distinguish between the effects of 5 animals, 4 birds and 3 reptiles',
					'Draws and shapes the effects of 5 animals, 4 birds and 3 reptiles',
					'Traces an animal, visualizing a scenario of what it did'
      			],[
      				'Explains the importance of tracing in the desert life',
					'Distinguish the effects of five people without seeing them',
					'Follows the trail of a human for a distance of 50 meters with a scenario envisioning his passage',
					'Shows his ability to hide with the help of what is available to him from natural or other means'
      			],[
      				'Little tracing techniques',
					"Distinguish a person's condition by tracing their trace",
					'Follows the trail of two people for a distance of 50 meters and visualizes a scenario for their passing',
					'Determine the number of people and the time period in which they left a camping station'
      			]
    ]
  }),
  Mission(image: 'assets/7.png', missiondata: {
    'badge': 'Roaming badge',
    'obj': [
      			[
      				'Defines the components of the compass and their importance',
					'Fluent in using the compass and identifies the original, subsidiary and sub-branch',
					'Able to determine the direction of the Qibla',
					'Explains the importance of estimating dimensions and heights, with some notes that help in estimating'
      			],[
	      			'Proficient in using the compass and adjusting the azimuth',
					'Fluent in determining direction through natural phenomena by: trees, Muslim cemeteries, scorpion clock',
					'He is fluent in two ways by estimating the distance between two points',
					'Makes a compass from available materials'
      			],[
      				'He mastered drawing a road using the compass using that direction and the azimuth with precision',
					'Fluent in determining direction through astronomical phenomena by observing (sun, moon, stars ....)',
					'Fluent in 3 ways to estimate height',
					'Prepares a mural about direction finding methods'
      			]
    ]
  }),
  Mission(image: 'assets/8.png', missiondata: {
    'badge': 'Roaming badge',
    'obj': [
		      	[
			      	'Shows a road on the map with the use of the compass in it',
					'Mention the importance of road signs in the life of a Scout',
					'Makes a mural containing scout road signs',
					'Count and play a game using road signs'
				],[
					'Improves the explanation of the keys of the entire map',
					'Reviews road signs icons',
					'He draws an approximate map from the house to the regiment, using special keys on his map',
					'Draws a route to guide two scouts using scout road signs'
				],[
					'Distinguishes between three types of maps and shows the scope of their use',
					'Preparing a cellular output program with a detailed determination of the expected time and location on the map with the application',
					'Drawing a route during the cellular output, indicating the requirements, distribution of resources and implementation',
					'Preparation and implementation of a major game using road signs',
				]
    ]
  }),
  Mission(image: 'assets/9.png', missiondata: {
    'badge': 'Roaming badge',
    'obj': [
			    [
			        'Proficient in the use of rally signals and calls',
			        'Defines the concept of communicating with secret messages',
			        'Sends a short message using Morse (from a paper)',
			        'Sends a short message using a semaphore (from a paper)'
				],[
					'Exercising assembly signals and calls in cellular activity',
					'Receives a short message using Morse (from the paper)',
					'Receives a short message using the semaphore (from the paper)',
					'He prepares and participates in a major game in a cell phone, in which he uses encrypted messages (Morse and Semaphore)'
				],[
					'Prepares a mural that separates all assembly and communication signals using Morse and Semaphore',
					'Sends and receives a short message using Morse (Save)',
					'Sends and receives a short message using semaphore (save)',
					'Makes a code transmitter'
				]
    ]
  }),
  Mission(image: 'assets/10.png', missiondata: {
    'badge': 'Roaming badge',
    'obj': [
			    [
			      	'Distinguish between knots, ties, and cycles',
					'Master 4 knots, 2 turns and 1 tie',
					'He is able to tie a parcel with the appropriate tie',
					'He makes models according to his knowledge of the necessary facilities when camping (kitchen pantry, clothes rack, shoe rack...)'
			    ],[
					'Distinguish between types of ropes',
					'Master 7 knots, 4 turns and 1 tie',
					'He knows how to make a ladder of ropes and wood',
					"He is skilled in making a fence and gate using firewood and ropes at the club's headquarters"
			    ],[
					'Master 10 knots, 5 turns and 1 tie',
					'He is able to make a net or a sleeping bed using ropes',
					'During a cellular camp, a fence and gate are erected using firewood and ropes',
					'Makes the necessary facilities in the camp with a note on the objectives, supplies and implementation stages (kitchen pantry, clothes rack, shoe rack, cooking pot holder...)'
			    ]    
			]
  }),
  Mission(image: 'assets/11.png', missiondata: {
    'badge': 'Roaming badge',
    'obj': 	[
			    [
			      	"He is fluent in 5 shouts and 4 scouting songs",
					"Fluent in 3 scouting games",
					"Take part in a theatrical performance with the Scouts",
					"Arranges a notebook for scouts' shouts and chants"

			    ],[
					"Prepares a summer evening program",
					"Fluent in activating a game in the evening",
					"Prepares the evening venue and the necessary equipment",
					"Performs a solo theatrical performance"
			    ],[
					"Prepares a campfire evening program",
					"Prepares the venue and requirements of the evening",
					"Contributes to the activation of the evening",
					"Prepares an audio-visual archive of the activation stations that he made",			   
				]    
			]
  }),
  Mission(image: 'assets/12.png', missiondata: {
    'badge': 'Roaming badge',
    'obj': 	[
			      	['Shows the various elements of the art of camping',
'Prepares a list of personal and group equipment for the last week of camp',
'He is good at setting up, folding and keeping an individual tent',
'To have spent a night under tents'
],[
					'Shows the types of tents and participates in setting up a collective tent supported by pictures',
'He prepares drawings for the most famous camp plans, with the preparation of a model he deems appropriate for his band (depending on the available capabilities)',
'Fluent in the ritual of raising the flag (drawing the square, raising the flag, keeping the flag)',
'To have spent 3 nights under tents'
			    ],[
					'Embodies a blueprint for the camp on the ground in a cell camp (Memorizing by anthropomorphism)',
'Explains the constituent elements of the fire triangle (spark, oxygen, combustible substance) visualizing possible fire scenarios and ways to extinguish them',
'The way to keep all the camp furniture in a proper way and to leave the place is better than it was, with mentioning the impact you made in the camping place',
'To have spent 6 nights under tents'				    ]    
			]
  }),
];
