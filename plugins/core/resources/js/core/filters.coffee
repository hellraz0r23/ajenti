angular.module('core').filter 'bytes', () ->
    return (bytes, precision) ->
        if isNaN(parseFloat(bytes)) or !isFinite(bytes) 
            return '-'
        if bytes == 0
            return '0 bytes'
        if typeof precision == 'undefined'
            precision = 1
        units = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB']
        number = Math.floor(Math.log(bytes) / Math.log(1024))
        return (bytes / Math.pow(1024, Math.floor(number))).toFixed(precision) +  ' ' + units[number]


angular.module('core').filter 'ordinal', () ->
    return (input) ->
        if isNaN(input) or input == null 
            return input

        s = ["th", "st", "nd", "rd"]
        v = input % 100
        return input + (s[(v - 20) % 10] or s[v] or s[0])


angular.module('core').filter 'page', () ->
    return (list, page, pageSize) ->
        if list and pageSize
            return list.slice((page - 1) * pageSize, page * pageSize)