function remove_upgrade_from_array(_arr, _obj)
{
    var _len = array_length(_arr);
    var _new = [];
    var _removed = false;
    var _at = 0;

    for (var i = 0; i < _len; i++)
    {
        if (_arr[i] == _obj && !_removed)
        {
            _removed = true;
            continue;
        }

        _new[_at++] = _arr[i];
    }

    return _new;
}