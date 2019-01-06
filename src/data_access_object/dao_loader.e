note
	description: "Ancestor of all DAO's."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DAO_LOADER [G]

inherit
	DAO [G]

feature -- Initialization

	make
			-- Create a new DAO
		deferred
		end

feature -- Input

	load_all
			-- Load all items.
			-- Make result available in `last_list'.
		do
			is_ok := false
			do_load_all
			if is_ok then
				last_count := last_list.count
			else
				last_count := 0
			end
		end

	load_by_identification (an_identification: STRING)
			-- Load an item using `an_identification'.
		do
			is_ok := false
			do_load_by_identification(an_identification)
			if is_ok then
				last_count := last_list.count
			else
				last_count := 0
			end
		end

	load_by_criteria (a_criteria: CRITERIA [ANY])
			-- Load all items meeting `a_criteria'.
		do
			is_ok := false
			do_load_by_criteria(a_criteria)
			if is_ok then
				last_count := last_list.count
			else
				last_count := 0
			end
		end

	load_item_count
			-- Retrieve the number of items.
			-- Make result available in `last_item_count'
		do
			is_ok := false
			do_load_item_count
			if is_ok then
				last_count := last_list.count
			else
				last_count := 0
			end
		end

	load_page (offset, count: NATURAL)
			-- Load `count' items starting at `offset'.
		do
			is_ok := false
			last_count := do_load_page (offset, count)
		end

feature {NONE} -- Implementation

	do_load_all
			-- Load all items.
			-- Make result available in `last_list'.
		deferred
		end

	do_load_by_identification (an_identification: STRING)
			-- Load an item using `an_identification'.
		deferred
		end

	do_load_by_criteria (a_criteria: CRITERIA [ANY])
			-- Load all items meeting `a_criteria'.
		deferred
		end

	do_load_item_count
			-- Retrieve the number of items.
			-- Make result available in `last_item_count'
		deferred
		end

	do_load_page (offset, count: NATURAL): INTEGER
			-- Load `count' items starting at `offset'.
		deferred
		end


feature -- Access

	last_count: INTEGER
			-- Number of items returned by last invocation of `load_item_count'

end -- class PP_DAO
