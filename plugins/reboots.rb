# Encoding: utf-8
Ohai.plugin(:Reboots) do
  provides 'reboots'

  collect_data(:linux) do
    so = shell_out('last')
    if so
      lines = so.stdout.split(/\n/).reject(&:empty?)[2..-1]
    end

    reboots Array.new
    if lines
      for line in lines
        case line
	when /reboot/
	  line_data = line.split()
	  reboots.push({
	    :month => line_data[5],
	    :day => line_data[6],
	    :time => line_data[7]
	  })
	else
	  next
        end
      end 
    end
  end
end
