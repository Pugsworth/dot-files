#!/usr/bin/env ruby

require 'tty-spinner'


def getiNode(file)
    stat = File::stat(file);
    return stat.ino;
end

def crawlNodes(path)
    inodes    = [];
    dir_defer = [];

    # puts path;

    Dir.foreach(path) do |entry|
        next if ['.', '..'].include?(entry);

        fullpath = File::join(path, entry);

        if File::directory?(fullpath) then
            dir_defer.push(fullpath);
            next;
        else
            inode = getiNode(fullpath);

            inodes.push([inode, fullpath]);

            # puts "\t#{entry} - #{inode}";
        end
    end

    dir_defer.each do |dir|
        inodes.concat crawlNodes(dir);
    end

    return inodes;
end

def findLikeiNodes(files, path)
    path   = File::expand_path(path);
    inodes = crawlNodes(path);
    found  = [];

    files.each do |file|
        file = File::absolute_path(File::join(Dir::getwd, file));
        fino = getiNode(file);

        ffound = [];

        inodes.each do |data|
            inode    = data[0];
            filepath = data[1];

            if fino == inode then
                ffound.push(filepath);
            end
        end

        found.push([file, ffound]) if ffound.length > 0;

    end

    return found;
end



def main()

    spinner = TTY::Spinner.new("[:spinner] Scanning files...", :format => :classic);

    trap ("INT") { spinner.stop(); exit 1; };

    files = Dir[".*"];
    path = "~/";

    foundfiles = [];

    # spinner.start;
    spinner.auto_spin;

    foundfiles = findLikeiNodes(files, path);

    spinner.success("done.\n");

    foundfiles.each do |data|
        puts data[0];
        data[1].each { |f| puts "\t #{f}"; };
    end

end

main();
