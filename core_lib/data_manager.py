import os
import sys
import functools
import operator

dir_name = os.path.dirname(__file__).replace("core_lib", "")
sys.path.append(dir_name)
from core_lib.utilities import read_yaml

api_data_files = []
api_data_dir = os.path.join(dir_name, "data", "api")
e2e_data_dir = os.path.join(dir_name, "data", "e2e")


def __get_files(folder):
    result = []
    for file in os.listdir(folder):
        file_path = os.path.join(folder, file)
        if os.path.isfile(file_path):
            result.append(file_path)
    return result


api_data_files = __get_files(api_data_dir)
e2e_data_files = __get_files(e2e_data_dir)

E2E_DATA = {}
for file in e2e_data_files:
    E2E_DATA.update(read_yaml(file))

API_DATA = {}
for file in api_data_files:
    API_DATA.update(read_yaml(file))


def __get_from_dict(data_dict, map_list):
    return functools.reduce(operator.getitem, map_list, data_dict)


def get_e2e_test_data(key):
    """Get E2E test data if key not found return key

    Args:
        key (str): key should in format "key" or "parent.child.child"

    Returns:
        any: (str, list, dict, int)
    """
    keys = key.split(".")
    try:
        return __get_from_dict(E2E_DATA, keys)
    except Exception:
        return key


def get_api_test_data(key):
    """Get API test data, if the key not found return key

    Args:
        key (str): key should in format "key" or "parent.child.child"

    Returns:
        any: (str, list, dict, int)
    """
    keys = key.split(".")
    try:
        return __get_from_dict(API_DATA, keys)
    except Exception:
        return key
