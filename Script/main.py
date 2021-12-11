from flask import request
import requests
import datetime
from flask import Flask, jsonify






#headers={'username':'admin','password':'password'}


		



app = Flask(__name__)


from flask import current_app



'''@pytest.fixture
def client():
    with app.test_client() as client:
        with app.app_context():  # New!!
            assert current_app.config["ENV"] == "production"
        yield client


def test_index_page(client):
   response = client.get('/')

   assert response.status_code == 200
   assert b'Welcome!' in response.data'''

#localisation='Tunis'
@app.route('/receive', methods=["POST"])
def receiving_location():
	query = request.get_json()
	
	res = query['localisation']
	
	localisation=res
	print(localisation)
	return res
#localisation= receiving_location()

def get_weather(localisation):
	days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
	r = requests.get(f'https://api.openweathermap.org/data/2.5/forecast?q={localisation}&units=metric&APPID=fbf0c9f6621085fb191ac5019906443d')
	'''print(r.json()['list'][0])
	print('\n-------------------------------------\n')
	print(r.json()['list'][0]['main'])
	print('\n-------------------------------------\n')
	print(r.json()['list'][0]['wind'])
	print('\n-------------------------------------\n')
	print(r.json()['list'][0]['weather'])
	print('\n-------------------------------------\n')
	print(r.json()['list'][0]['dt_txt'])
	print('\n-------------------------------------\n')
	print(r.json()['list'][0]['clouds']['all'])
	print('temperature actuel: ',r.json()['list'][0]['main']['temp'])'''
	cnt = len(r.json()['list'])
	date = r.json()['list'][0]['dt_txt'][:10]
	l=[]
	l2=[]
	k=0
	j=0
	json={}
	json_current = {} 
	for i in range(cnt):
		iter_date = r.json()['list'][i]['dt_txt']
		d = datetime.datetime(year=int(iter_date[:4]), month=int(iter_date[5:7]), day=int(iter_date[8:10]),hour=int(iter_date[11:13]),minute=int(iter_date[14:16]))
		if i < 5:
			json_current[f'{i}'] = {'time':d.strftime("%a, %I:%M %p"),'time_slider':d.strftime("%I %p"),'temp':int(r.json()['list'][i]['main']['temp']),'description':r.json()['list'][i]['weather'][0]['description'],'icon':r.json()['list'][i]['weather'][0]['icon'],'humidity':str(r.json()['list'][i]['main']['humidity'])+"% humidity" ,'wind':str(int((r.json()['list'][i]['wind']['speed'])*3.6))+' km/h Winds'}
		iterdate = iter_date[:10]
		if date == iterdate:
			k=k+1
			if k==4:
				k=0

				icon = r.json()['list'][i]['weather'][0]['icon']
			
			l.append(r.json()['list'][i]['main']['temp_min'])
			l2.append(r.json()['list'][i]['main']['feels_like'])
		else:
			date = iterdate
			if j>=1:
				mi = min(l2) if min(l)>min(l2) else min(l);
				
				ma = max(l) if max(l)>max(l2) else max(l2); 
				
				json[f'{j}']={'day':days[intDay],'temp_min':int(mi),'temp_max':int(ma),'icon':icon}

			l=[]
			l2=[]
			k=0

			#print('\n-------------------------------------\n')
			intDay = datetime.date(year=int(date[:4]), month=int(date[5:7]), day=int(date[8:10])).weekday()
			
			#json[f'{j}']={'day':days[intDay]}
			j=j+1
			
			
			#print(r.json()['list'][i]['weather'][0]['icon'])
			l.append(r.json()['list'][i]['main']['temp_min'])
			l2.append(r.json()['list'][i]['main']['feels_like'])

	json[f'{j}']={'day':days[intDay],'temp_min':int(min(l2)) if min(l)>min(l2) else int(min(l)),'temp_max':int(max(l)) if max(l)>max(l2) else int(max(l2)),'icon':icon}
	return (json_current,json)

@app.route('/api/<string:localisation>')
def hello_world(localisation):
	print('api',localisation)
	json_file = {}
	json_file['json_current'] = get_weather(localisation)[0]
	json_file['json'] = get_weather(localisation)[1]
	return jsonify(json_file)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)


