require './credit_check'


card_valid = CreditCheck.new
card_valid.valid("5541808923795240")
card_valid.american_express("342804633855673")
card_valid.valid('5541801923795240')
