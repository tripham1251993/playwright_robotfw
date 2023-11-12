import yaml


def read_yaml(file):
    with open(file, "r", encoding="utf-8") as f:
        return yaml.safe_load(f)


def write_to_yaml(file, dict_content):
    with open(file, "w") as f:
        return yaml.dump(dict_content, f)


def write_file(file, data):
    with open(file, "w") as f:
        return f.write(data)
