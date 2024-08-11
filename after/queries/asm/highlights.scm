;; extends
(
	(line_comment) @comment.todo
	(#match? @comment.todo "(todo|TODO|Todo)")
	(#set! "priority" 150)
)

;; extends
(
	(block_comment) @comment.todo
	(#match? @comment.todo "(todo|TODO|Todo)")
	(#set! "priority" 150)
)
