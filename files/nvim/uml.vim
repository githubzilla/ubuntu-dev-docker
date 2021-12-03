"docker run --platform linux/amd64 -d -p 8889:8080 plantuml/plantuml-server:jetty-v1.2020.23
let g:preview_uml_url='http://localhost:8889'
":PreviewUML
nnoremap <leader>uml <cmd>PreviewUML<cr>
