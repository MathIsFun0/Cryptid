from pydub import AudioSegment
from scipy.io import wavfile
import numpy as np

def change_speed_and_pitch(sound, speed=1.0):
    # Changing speed and pitch
    sound_with_altered_frame_rate = sound._spawn(sound.raw_data, overrides={
        "frame_rate": int(sound.frame_rate * speed)
    })
    return sound_with_altered_frame_rate.set_frame_rate(sound.frame_rate)

# Load the OGG file
audio = AudioSegment.from_file("input.ogg", format="ogg")

# Speed factor (10/7)
speed_factor = 10 / 7

# Change speed and pitch
new_audio = change_speed_and_pitch(audio, speed_factor)

# Export the result
new_audio.export("output.ogg", format="ogg")

print("The audio file has been processed and saved as output.ogg")
