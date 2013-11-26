require 'mpd32api/version'
require 'mpd32api/mapping'
require 'unimidi'

module Mpd32Api
  def Mpd32Api.get_midi_input_device
    UniMIDI::Input.gets
  end

  def Mpd32Api.get_midi_output_device
    UniMIDI::Output.gets
  end

  class Library
    def initialize(input_device, output_device)
      input_device.instance_of?(UniMIDI::CoreMIDIAdapter::Input) ?
          @input = input_device :
          @input = UniMIDI::Input.use(input_device)
      output_device.instance_of?(UniMIDI::CoreMIDIAdapter::Output) ?
        @output = output_device :
        @output = UniMIDI::Output.use(output_device)
    end

    def start_read_input
      @input.open
      loop {
        message = @input.gets
        p message
      }
    end

    def send_msg(message)
      @output.open { |output|
        output.puts(message)
      }
    end

    def switch_to_control_bank(x)
      self.send_msg Mpd32Api::MIDI_MAPPING[:control_bank][x]
    end

    def switch_to_pad_bank(x)
      self.send_msg Mpd32Api::MIDI_MAPPING[:pad_bank][x]
    end

    def note_repeat(x)
      self.send_msg Mpd32Api::MIDI_MAPPING[:note_repeat][x]
    end

    def time_division(x)
      self.send_msg Mpd32Api::MIDI_MAPPING[:time_division][x]
    end

    def showcase
      Mpd32Api::MIDI_MAPPING.each do |kx,vx|
        vx.each do |ky,vy|
          self.send_msg vy
          sleep 1
        end
      end
    end
  end
end
