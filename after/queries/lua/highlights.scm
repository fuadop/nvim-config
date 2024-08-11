;; extends
(
	(comment) @comment.todo
	(#match? @comment.todo "(todo|TODO|Todo)")
	(#set! "priority" 150)
)
