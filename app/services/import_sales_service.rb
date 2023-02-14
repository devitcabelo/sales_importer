class ImportSalesService
	require 'csv'

	def initialize(file)
		@file = file
	end

	def import
		ActiveRecord::Base.transaction do
			purchase = Purchase.new(gross_income: 0)
			CSV.read(@file, col_sep: "\t", headers: true).each_with_index do |sale, index|
				validate_numeric_columns(sale, index)

				merchant = Merchant.create(address: sale[4], name: sale[5])
				purchaser = Purchaser.create(name: sale[0])
				item = Item.create(
					merchant: merchant, 
					purchaser: purchaser, 
					purchase: purchase,
					description: sale[1], 
					price: sale[2], 
					purchase_count: sale[3]
				)
				purchase.gross_income += item.price * item.purchase_count
			end
			purchase.save!
			purchase
		end
	end

	def validate_numeric_columns(sale, line)
		unless is_numeric?(sale[2])
			raise StandardError.new(I18n.t('errors.csv.numeric', column: 3, line: line + 1, value: sale[2]))
		end
		unless is_numeric?(sale[3])
			raise StandardError.new(I18n.t('errors.csv.numeric', column: 4, line: line + 1, value: sale[3]))
		end
	end

	def is_numeric?(value)
		Float(value) != nil rescue false
	end
end