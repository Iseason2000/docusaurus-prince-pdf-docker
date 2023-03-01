
>  this project was modify by https://github.com/signcl/docusaurus-prince-pdf

[Docker Hub](https://hub.docker.com/repository/docker/iseason/docusaurus-to-pdf/general)

## preview

![QQ截图20230301215623](https://user-images.githubusercontent.com/65019366/222173525-efa2500a-6083-4316-a7f2-1d4f1e4fb32b.png)

## Usage

~~~ bash
docker run --rm -v {pdf path}:/app/pdf -v {custom font path}:/app/custom-font iseason/docusaurus-to-pdf -u {doc url}
~~~

## example

~~~ bash
# without custom font
docker run --rm -v /root/pdf:/app/pdf iseason/docusaurus-to-pdf -u https://docusaurus.io/docs

# custom font
docker run --rm -v /root/pdf:/app/pdf -v /root/font:/app/custom-font iseason/docusaurus-to-pdf -u https://docusaurus.io/docs
~~~

when you want to apply `custom font`. please rename your font file to `font.ttf` `font.ttc` or `font.otf`.  
then place it into {custom font path} which path in your local system

your pad will be save at {pdf path} 

## options

~~~ bash 
Options:
      --version           Show version number                          [boolean]
  -u, --url               Base URL, should be the baseUrl of the Docusaurus inst
                          ance (e.g. https://docusaurus.io/docs/)       [string]
  -s, --selector          CSS selector to find the link of the next page[string]
  -d, --dest              Working directory. Default to ./pdf           [string]
  -f, --file              Change default list output filename           [string]
  -o, --output            Change PDF output filename                    [string]
      --include-index     Include / (passed URL) in generated PDF
      --prepend           Prepend additional pages, split with comma    [string]
      --append            Append additional pages, split with comma     [string]
      --prince-args       Additional options for Prince.                [string]
                          ie. --prince-args="--page-size=\'210mm 297mm\'" 
                          or --prince-args "\\-\\-page\\-size=\'210mm 297mm\'" 
      --list-only         Fetch list without generating PDF
      --pdf-only          Generate PDF without fetching list. Ensure list exists
  -h, --help              Show help                                    [boolean]
~~~
