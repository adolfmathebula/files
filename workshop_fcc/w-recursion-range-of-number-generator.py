def countup(number):
    if number < 1:
        return []
    count_list = countup(number -1) # add the recursive case.
    count_list.append(number)
    return count_list


def range_of_numbers(start_num, end_num):
    if start_num == end_num:
        return [start_num]

    count_list = range_of_numbers(start_num, end_num - 1)
    count_list.append(end_num)

    return count_list