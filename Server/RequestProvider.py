import traceback

import requests
from requests import Session

class RequestProvider:
    @staticmethod
    def get_request(url, params=None):
        try:
            if params is not None:
                session = Session()
                session.headers.update(params)
                result = session.get(url)
                session.close()
            else:
                result = requests.get(url)
            if result.status_code == 200:
                return result.json()
            else:
                raise Exception
        except:
            print(traceback.format_exc())
            return None
    @staticmethod
    def post_request(url, data):
        try:
            result = requests.post(url, data=data)
            if result.status_code == 200:
                return result.json()
            else:
                raise Exception
        except:
            print(traceback.format_exc())
            return None
