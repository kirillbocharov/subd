import hashlib

__author__ = 'vadik'


def to_md5(str):
    hash_md5 = hashlib.md5()
    hash_md5.update(str)
    return hash_md5.hexdigest()
