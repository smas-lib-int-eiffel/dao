note
	description: "Data Access Objects."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DAO [G]

feature -- Input

	load_all
			-- Load all items.
			-- Make result available in `last_list'.
		deferred
		end

feature -- Access

	last_list: LIST [G]
			-- Last list of items found

	last_item: detachable G
			-- Last item found
		do
			if not last_list.is_empty then
				Result := last_list.first
			end
		end

feature -- Status report

	is_ok: BOOLEAN
			-- Was last operation ok ?
			
end -- class DAO
