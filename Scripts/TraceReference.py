"""Editable front-elevation tracing, measured on the user's 1887px reference.

Generate local SwiftUI paths and placement maps from a single registration.
The GIF is a switchable guide only; every animated plate is a vector shape.
Commands use SVG order (Q control/end, C control/control/end).
"""
from pathlib import Path
import re
import math

ROOT = Path(__file__).resolve().parents[1] / 'ironman-markIII'
plates = []

def parse(s):
    tokens = re.findall(r'[MLQCZE]|-?\d+(?:\.\d+)?', s)
    result = []
    lengths = {'M': 2, 'L': 2, 'Q': 4, 'C': 6, 'Z': 0, 'E': 4}
    while tokens:
        op = tokens.pop(0)
        n = lengths[op]
        result.append((op, list(map(float, tokens[:n]))))
        tokens = tokens[n:]
    return result

def add(name, region, outline, seams='', material='red', z=4, light='', shade='', number=None):
    plates.append(dict(name=name, region=region, outline=parse(outline), seams=parse(seams),
                       light=parse(light), shade=parse(shade), material=material, z=z, number=number))

def pair(suffix, region, outline, seams='', material='red', z=4, light='', shade='', ids=None):
    add('Left'+suffix, 'left'+region, outline, seams, material, z, light, shade, ids[0] if ids else None)
    left = plates[-1]
    right = dict(left, name='Right'+suffix, region='right'+region, number=ids[1] if ids else None)
    for key in ['outline', 'seams', 'light', 'shade']:
        right[key] = []
        for op, values in left[key]:
            values = values.copy()
            if op == 'E': values[0] = 870-values[0]-values[2]
            else:
                for i in range(0, len(values), 2): values[i] = 870-values[i]
            right[key].append((op, values))
    plates.append(right)

# Helmet: straight brow, long flat cheeks, narrow jaw. The face seals last.
add('HelmetCrown','helmet','M 388 180 L 388 156 Q 390 118 428 117 Q 477 111 481 151 L 482 213 L 472 233 L 465 252 L 454 264 L 416 264 L 402 249 L 394 230 L 387 213 Z',
    'M 393 181 L 394 150 Q 398 125 421 124 M 449 123 Q 475 123 476 151 L 477 180',z=3,number=1)
add('FacePlate','helmet','M 399 138 L 414 129 L 456 129 L 471 138 L 474 179 L 471 202 L 457 224 L 451 239 L 419 239 L 413 224 L 399 202 L 396 180 Z',
    'M 397 180 L 420 187 L 450 187 L 474 180 M 399 192 Q 410 201 415 219 L 420 237 M 471 192 Q 460 201 455 219 L 450 237',
    material='brass',z=10,light='M 399 185 L 423 189 L 423 194 L 414 194 L 400 190 Z M 471 185 L 447 189 L 447 194 L 456 194 L 470 190 Z',number=2)
pair('Temple','Helmet','M 388 153 L 397 141 L 396 183 L 398 213 L 404 229 L 396 223 L 387 213 Z',
     'M 392 155 L 391 208 L 399 220',z=5,ids=(3,4))
pair('Cheek','Helmet','M 398 197 Q 410 207 416 237 L 422 259 L 415 262 L 404 247 L 398 229 Z',
     'M 402 212 L 413 239 L 417 255',z=6,ids=(5,6))
add('ChinGuard','helmet','M 418 239 L 452 239 L 448 261 L 441 267 L 429 267 L 422 260 Z',
    'M 423 243 L 447 243 M 426 257 L 444 257',material='brass',z=7,number=7)
add('NeckArmor','helmet','M 394 230 L 416 258 L 427 267 L 443 267 L 456 256 L 475 233 L 476 275 L 458 286 L 434 298 L 410 286 L 394 278 Z',
    'M 403 248 L 404 279 L 421 289 M 467 248 L 466 279 L 449 289 M 419 263 L 423 284 L 435 291 L 446 283 L 451 263 M 427 269 L 428 282 L 435 287 L 441 282 L 443 269',z=2,number=8)
add('CrownInset','helmet','M 418 130 L 452 130 L 448 155 L 422 155 Z','M 420 135 L 450 135',material='brass',z=11)
add('BrowBridge','helmet','M 423 187 L 447 187 L 447 193 L 423 193 Z',material='brass',z=11)

# Torso: shared plate boundaries are traced once, without invented decorative seams.
add('CentralChest','torso','M 364 317 L 405 340 L 422 350 L 449 350 L 465 340 L 506 317 L 515 345 L 496 381 L 482 417 L 474 451 Q 435 475 395 451 L 388 417 L 374 381 L 355 345 Z',
    'M 365 319 L 414 341 M 505 319 L 456 341 M 399 358 Q 385 373 391 397 M 404 360 Q 392 375 396 395 M 471 358 Q 485 373 479 397 M 466 360 Q 478 375 474 395',z=5,number=9)
pair('UpperChest','Torso','M 371 276 L 391 270 L 411 286 L 434 304 L 434 331 L 427 331 L 423 309 L 400 299 L 386 285 L 369 286 L 357 308 L 363 318 L 403 339 L 415 350 L 390 348 L 356 332 L 345 313 Z',
     'M 371 282 L 388 278 L 401 290 L 423 303 M 426 312 L 423 328 L 435 331 E 361 312 7 7',z=6,ids=(10,11))
pair('Clavicle','Torso','M 385 246 L 389 273 L 369 279 L 360 296 L 331 304 L 323 292 L 345 274 Z',
     'M 385 253 L 357 278 L 355 289 L 330 297',z=3,ids=(12,13))
add('ReactorOuterRing','torso','E 409 357 52 52',
    'E 412 360 46 46 E 417 365 36 36',material='graphite',z=8,number=14)
add('ReactorInnerRing','torso','E 419 367 32 32','E 422 370 26 26',material='brass',z=9,number=15)
add('ReactorCore','torso','E 427 375 16 16','',material='graphite',z=10,light='E 429 377 12 12',number=16)
# Reactor's actual radial teeth rather than arbitrary chest scratches.
for i in range(36):
    a = 2*math.pi*i/36
    plates[-3]['seams'] += [('M',[435+20*math.cos(a),383+20*math.sin(a)]),('L',[435+24*math.cos(a),383+24*math.sin(a)])]
pair('RibUpper','Torso','M 335 337 L 357 348 L 376 381 L 394 431 Q 356 414 324 387 L 323 364 Z',
     'M 328 368 Q 356 386 383 409 M 326 386 Q 355 415 392 437',z=3,ids=(17,18))
pair('RibLower','Torso','M 324 397 Q 354 430 394 449 L 371 478 L 345 472 Q 329 444 324 421 Z',
     'M 325 414 Q 351 444 382 457 M 331 441 L 354 464 L 369 473',z=3,ids=(19,20))
add('UpperAb','torso','M 395 450 Q 435 447 474 450 L 501 476 Q 485 506 435 506 Q 391 506 368 480 Z',
    'M 381 462 Q 435 481 488 462',z=6,number=21)
add('MidAb','torso','M 368 480 Q 435 529 501 479 L 492 528 Q 435 565 378 530 Z',
    'M 378 529 Q 433 561 492 528',z=5,number=22)
add('LowerAb','torso','M 378 530 Q 435 563 492 530 L 489 562 Q 436 596 381 563 Z',
    'M 383 563 Q 435 591 487 563',z=6,number=23)
pair('Waist','Torso','M 345 477 L 366 485 L 379 531 L 381 562 L 361 555 L 353 549 Z',
     'M 353 482 L 363 512 L 370 558',material='brass',z=2,ids=(24,25))
add('PelvisCenter','torso','M 395 593 Q 435 602 475 593 L 481 615 L 462 648 L 448 696 L 423 696 L 409 648 L 390 615 Z',
    'M 394 615 L 414 625 L 423 645 L 448 645 L 456 625 L 477 615 M 423 645 L 430 695 M 448 645 L 441 695 M 434 646 L 435 694',z=6,number=26)
pair('HipPlate','Torso','M 354 550 L 382 566 L 403 589 L 394 599 L 357 610 L 330 602 Z',
     'M 361 558 L 348 595 L 369 601 M 353 562 L 338 597 L 351 604 M 382 571 L 394 588',z=7,ids=(27,28))
pair('CollarLatch','Torso','M 425 301 L 430 299 L 434 304 L 433 311 L 427 311 Z','E 427 303 4 5',material='graphite',z=9)

# Arms: shoulder pivots, overlapping biceps bands, elbow bellows, forearm fins.
pair('ShoulderBell','Arm','M 244 316 Q 262 287 288 287 Q 314 284 326 312 L 333 330 L 321 349 L 251 348 L 247 334 L 239 347 L 237 347 Z',
     'M 241 331 L 252 333 L 252 344 M 251 334 L 316 337 L 329 328 M 274 296 L 284 288 L 290 290 L 287 294 L 294 298 L 286 297 L 282 293 L 278 299 Z',z=8,ids=(29,37))
pair('UpperArmOuter','Arm','M 250 346 L 275 355 L 291 371 L 272 462 L 245 459 L 245 416 Z',
     'M 261 360 L 259 390 M 249 436 L 274 441',material='brass',z=3,ids=(30,38))
pair('UpperArmInner','Arm','M 274 352 L 305 357 L 321 375 L 318 404 L 301 464 L 272 462 L 290 376 Z',
     'M 303 369 L 300 396 M 281 442 L 303 444',material='brass',z=3,ids=(31,39))
pair('ElbowJoint','Arm','M 246 464 L 296 473 Q 300 493 282 511 Q 262 530 240 511 Q 229 494 246 464 Z',
     'M 243 478 Q 265 473 292 492 M 240 485 Q 265 480 291 498 M 238 493 Q 259 488 286 504 M 242 502 Q 260 495 282 510',material='graphite',z=6,ids=(32,40))
pair('ForearmOuter','Arm','M 227 486 L 240 511 Q 256 530 282 512 L 280 551 Q 273 597 255 627 L 238 637 L 211 612 L 211 555 L 217 522 Z',
     'M 236 529 L 235 571 Q 236 604 242 627 M 278 537 Q 269 596 251 622',z=4,ids=(33,41))
pair('WristArmor','Arm','M 212 610 L 237 624 L 247 641 L 235 662 L 214 651 L 205 637 Z',
     'M 210 619 L 232 632 L 239 643 L 231 654',z=7,ids=(34,42))
pair('HandPlate','Arm','M 205 638 L 217 652 L 235 662 L 238 675 L 226 692 L 215 693 L 203 681 Z',
     'M 207 653 L 211 681 L 219 686 L 232 671 M 212 691 L 210 679',z=5,ids=(35,43))
pair('PalmRepulsor','Arm','M 214 676 L 224 674 L 230 680 L 225 691 L 217 693 Z',
     'M 219 679 L 224 679 L 226 683 L 222 689 L 218 688 Z',material='graphite',z=7,ids=(36,44))
pair('ShoulderPivot','Arm','E 294 327 38 38','E 299 332 28 28 E 304 337 18 18',material='graphite',z=7)
pair('BicepUpperBand','Arm','M 254 381 Q 270 355 295 369 Q 312 376 315 398 L 290 406 L 250 395 Z',
     'M 252 392 L 290 401 L 313 394',z=5)
pair('BicepLowerBand','Arm','M 248 403 L 290 410 L 316 402 L 312 432 L 281 440 L 244 431 Z',
     'M 245 429 L 282 435 L 313 429',z=5)
pair('ForearmFinUpper','Arm','M 222 485 L 235 512 L 239 527 L 221 515 L 216 501 Z',z=8)
pair('ForearmFinMiddle','Arm','M 214 510 L 239 531 L 225 542 L 211 531 Z',z=8)
pair('ForearmFinLower','Arm','M 207 525 L 225 543 L 212 566 Z','M 209 537 L 216 546',z=8)
# Edge-on relaxed hands; separately articulated finger armor, not open palms.
pair('ThumbProximal','Arm','M 237 652 L 253 663 L 250 670 L 233 663 Z','M 242 659 L 239 665',material='brass',z=8)
pair('ThumbDistal','Arm','M 253 663 L 274 676 L 272 681 L 249 670 Z','M 267 673 L 265 677',z=8)
pair('IndexProximal','Arm','M 218 691 L 230 690 L 234 705 L 224 712 L 220 704 Z','M 221 697 L 231 697',material='brass',z=8)
pair('IndexDistal','Arm','M 224 712 L 234 705 L 234 718 L 225 731 L 220 727 Z','M 225 719 L 231 714',z=8)
pair('MiddleProximal','Arm','M 208 694 L 217 693 L 224 718 L 216 723 L 210 711 Z','M 210 704 L 219 701 M 212 713 L 222 710',material='brass',z=7)
pair('MiddleDistal','Arm','M 216 723 L 224 718 L 229 736 L 222 755 L 217 753 L 211 733 Z','M 215 731 L 226 730 M 216 741 L 224 738',z=8)

# Legs: the reference has long continuous thigh and shin planes, small knee caps.
pair('HipConnector','Leg','M 337 605 L 355 612 L 392 615 L 402 646 L 376 656 L 336 646 Z',
     'M 354 610 L 355 616 L 390 616 M 397 623 L 405 646',z=5,ids=(45,60))
pair('ThighFrontUpper','Leg','M 337 647 L 375 650 L 402 663 L 407 689 L 397 731 L 375 718 L 359 721 L 343 732 L 335 696 Z',
     'M 339 651 L 374 651 L 399 663',material='brass',z=5,ids=(46,61))
pair('ThighFrontLower','Leg','M 343 732 L 359 720 L 375 718 L 397 731 L 383 812 L 351 812 Z',
     'M 348 769 L 354 810',material='brass',z=5,ids=(47,62))
pair('ThighOuter','Leg','M 327 638 L 337 650 L 336 692 L 344 734 L 351 812 L 339 836 L 329 798 L 320 755 L 321 690 Z',
     'M 326 655 L 322 701 M 326 769 L 337 791 L 334 807 M 329 790 L 341 817',z=3,ids=(48,63))
pair('ThighInner','Leg','M 395 616 L 411 649 L 423 696 L 411 779 L 401 831 L 384 820 L 397 734 L 408 690 L 403 649 Z',
     'M 414 699 L 403 783 L 392 815',z=4,ids=(49,64))
pair('KneeCap','Leg','M 347 833 Q 367 823 387 833 L 395 850 L 377 880 L 356 875 L 346 882 L 339 852 Z',
     'M 344 839 Q 364 828 385 838',z=8,ids=(50,65))
pair('KneeJoint','Leg','M 335 815 L 382 812 L 406 834 L 409 852 L 395 852 L 387 834 Q 365 822 347 834 L 339 851 L 330 854 Z',
     'M 339 819 L 382 818 L 399 836 L 401 851',material='graphite',z=5,ids=(51,66))
pair('ShinUpper','Leg','M 339 849 L 347 881 L 356 875 L 377 880 L 388 862 L 399 891 L 404 913 L 383 954 L 342 954 L 322 916 Z',
     'M 354 879 L 342 951 M 377 883 L 371 951',z=6,ids=(52,67))
pair('ShinCenter','Leg','M 319 921 L 337 958 L 374 960 L 400 921 L 402 987 Q 398 1021 375 1059 Q 358 1070 342 1057 L 314 1012 L 313 956 Z',
     'M 320 929 L 334 960 L 341 964 L 371 964 L 393 936',z=5,ids=(53,68))
pair('ShinOuter','Leg','M 313 1008 L 342 1058 L 345 1098 L 325 1104 L 319 1080 Z',
     'M 319 1028 L 327 1089',z=4,ids=(54,69))
pair('CalfArmor','Leg','M 400 1002 L 394 1080 L 378 1105 L 365 1097 L 375 1059 Z',
     'M 393 1030 L 384 1094',z=4,ids=(55,70))
pair('AnkleGuard','Leg','M 325 1103 L 344 1097 L 364 1099 L 376 1105 L 374 1147 L 316 1147 Z',
     'M 342 1101 L 334 1144 M 364 1103 L 365 1145',z=7,ids=(56,71))
pair('FootUpper','Leg','M 316 1143 Q 346 1150 376 1143 L 381 1170 L 366 1184 L 328 1184 L 310 1173 Z',
     'M 315 1150 L 335 1153 L 364 1153 L 377 1149 M 334 1152 L 331 1175 L 366 1175 L 364 1152 M 312 1170 L 331 1175 M 366 1175 L 379 1170',z=6,ids=(57,72))
pair('ToePlate','Leg','M 310 1173 L 329 1185 L 366 1185 L 381 1173 L 381 1218 L 303 1218 Z',
     'M 309 1181 L 318 1214 L 370 1214 L 378 1180 M 329 1186 L 318 1214 M 364 1186 L 370 1214 M 304 1214 L 380 1214 M 336 1180 L 335 1187 L 357 1187 L 357 1180',z=7,ids=(58,73))
pair('HeelArmor','Leg','M 373 1135 L 381 1155 L 381 1218 L 375 1190 L 371 1171 Z',
     'M 378 1158 L 375 1173',z=3,ids=(59,74))
pair('KneeSideHinge','Leg','M 398 830 L 410 832 L 411 850 L 402 850 Z','M 405 834 L 405 847',material='graphite',z=9)

# Fine relief follows real folds and returns instead of adding arbitrary scratches.
relief = {
    'FacePlate': 'M 399 141 L 403 139 L 401 180 L 404 202 L 419 231 L 420 237 L 413 224 L 399 202 L 396 180 Z M 471 141 L 467 139 L 469 180 L 466 202 L 451 231 L 450 237 L 457 224 L 471 202 L 474 180 Z',
    'LeftClavicle': 'M 323 292 L 331 304 L 360 296 L 369 279 L 389 273 L 385 270 L 366 277 L 356 292 L 332 300 Z',
    'LeftUpperChest': 'M 345 313 L 356 332 L 390 348 L 415 350 L 407 344 L 391 344 L 359 329 L 349 313 Z',
    'CentralChest': 'M 355 345 L 374 381 L 388 417 L 395 451 L 399 449 L 392 415 L 378 379 L 360 345 Z M 515 345 L 496 381 L 482 417 L 474 451 L 470 449 L 478 415 L 492 379 L 510 345 Z',
    'LeftRibUpper': 'M 324 382 L 324 387 Q 356 414 394 431 L 390 423 Q 351 406 324 382 Z',
    'LeftRibLower': 'M 327 432 L 345 472 L 371 478 L 376 471 L 346 467 Z',
    'UpperAb': 'M 368 480 Q 391 506 435 506 Q 485 506 501 476 L 495 478 Q 477 502 435 502 Q 393 502 375 480 Z',
    'MidAb': 'M 378 525 Q 435 559 492 523 L 492 528 Q 435 565 378 530 Z',
    'LowerAb': 'M 381 558 Q 436 592 489 557 L 489 562 Q 436 596 381 563 Z',
    'LeftShoulderBell': 'M 239 332 L 247 331 L 251 344 L 318 345 L 326 336 L 333 330 L 321 349 L 251 348 L 247 334 L 239 347 Z',
    'LeftUpperArmInner': 'M 311 372 L 318 404 L 301 464 L 295 462 L 312 403 Z',
    'LeftBicepUpperBand': 'M 250 391 L 290 401 L 315 393 L 315 398 L 290 406 L 250 395 Z',
    'LeftBicepLowerBand': 'M 244 427 L 282 435 L 313 427 L 312 432 L 281 440 L 244 431 Z',
    'LeftForearmOuter': 'M 279 519 L 280 551 Q 273 597 255 627 L 238 637 L 236 631 L 251 622 Q 271 588 275 546 Z',
    'LeftThighOuter': 'M 327 648 L 331 650 L 329 710 L 339 764 L 345 810 L 339 836 L 337 822 L 340 809 L 334 766 L 324 711 Z',
    'LeftThighInner': 'M 407 670 L 415 699 L 403 783 L 392 815 L 401 831 L 411 779 L 423 696 L 411 649 Z',
    'LeftShinUpper': 'M 322 916 L 342 954 L 383 954 L 404 913 L 400 913 L 380 950 L 345 950 L 325 912 Z',
    'LeftShinCenter': 'M 313 956 L 314 1012 L 342 1057 L 348 1060 L 319 1010 L 318 955 Z',
    'LeftAnkleGuard': 'M 325 1103 L 330 1101 L 322 1145 L 316 1147 Z',
    'LeftToePlate': 'M 303 1214 L 381 1214 L 381 1218 L 303 1218 Z',
}
for p in plates:
    key=p['name'].replace('Right','Left')
    if key in relief:
        commands=parse(relief[key])
        if p['name'].startswith('Right'):
            commands=[(op, [870-value if i%2==0 else value for i,value in enumerate(values)]) for op,values in commands]
        p['shade']=commands
    if p['name']=='NeckArmor':
        for y in [270,274,278,282]:
            p['seams'] += parse(f'M 428 {y} Q 435 {y+5} 442 {y}')

# Normalize region names used by the pair helper.
for p in plates:
    if p['region'].endswith('Helmet'): p['region']='helmet'
    if p['region'].endswith('Torso'): p['region']='torso'
next_id = 75
for p in plates:
    if p['number'] is None:
        p['number'] = next_id
        next_id += 1

def bounds(commands):
    xs,ys=[],[]
    for op,v in commands:
        if op=='E': xs += [v[0],v[0]+v[2]]; ys += [v[1],v[1]+v[3]]
        else: xs += v[::2]; ys += v[1::2]
    return min(xs),min(ys),max(xs),max(ys)

def emit(commands, b):
    x,y,x2,y2=b
    w,h=x2-x,y2-y
    def point(a,b): return f'CGPoint(x: {(a-x)/w*100:.4f}, y: {(b-y)/h*100:.4f})'
    lines=[]
    for op,v in commands:
        if op=='Z': lines.append('p.closeSubpath()')
        elif op=='E': lines.append(f'p.addEllipse(in: CGRect(x: {(v[0]-x)/w*100:.4f}, y: {(v[1]-y)/h*100:.4f}, width: {v[2]/w*100:.4f}, height: {v[3]/h*100:.4f}))')
        elif op=='M': lines.append(f'p.move(to: {point(*v)})')
        elif op=='L': lines.append(f'p.addLine(to: {point(*v)})')
        elif op=='Q': lines.append(f'p.addQuadCurve(to: {point(*v[2:])}, control: {point(*v[:2])})')
        elif op=='C': lines.append(f'p.addCurve(to: {point(*v[4:])}, control1: {point(*v[:2])}, control2: {point(*v[2:4])})')
    return '\n'.join('            '+line for line in lines)

for p in plates:
    b=bounds(p['outline'])
    p['bounds']=b
    region=p['region'][0].upper()+p['region'][1:]
    target=ROOT/'Components'/region/(p['name']+'.swift')
    text='import SwiftUI\n\n/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.\n'
    text+=f"struct {p['name']}: View {{\n"
    for key in ['outline','seams','light','shade']:
        text+=f'    private var {key}: Path {{\n        Path {{ p in\n{emit(p[key],b)}\n        }}\n    }}\n'
    text+=f"    var body: some View {{\n        SketchPlate(outline: outline, seams: seams, material: .{p['material']}, luminous: light, shading: shade, grain: {p['number']})\n    }}\n}}\n"
    target.write_text(text)

for region in ['helmet','torso','leftArm','rightArm','leftLeg','rightLeg']:
    title=region[0].upper()+region[1:]+'Assembly'
    text=f'import SwiftUI\n\nstruct {title}: View {{\n    @ObservedObject var state: MarkIIIState\n    var body: some View {{ AssemblyRegionView(region: .{region}, state: state) }}\n}}\n\nextension {title} {{\n    static let parts: [AssemblyPart] = [\n'
    for p in sorted([p for p in plates if p['region']==region],key=lambda p:p['number']):
        x,y,x2,y2=p['bounds']; w,h=(x2-x)*.60,(y2-y)*.60
        cx,cy=195+((x+x2)/2-435)*.60,40+((y+y2)/2-116)*.60
        entry='left' if region.startswith('left') else 'right' if region.startswith('right') else 'top' if region=='helmet' else 'settle'
        if 'Leg' in region and ('Foot' in p['name'] or 'Toe' in p['name'] or 'Heel' in p['name']): entry='bottom'
        if p['name']=='FacePlate': entry='faceSeal'
        short=re.sub(r'([a-z])([A-Z])',r'\1 \2',p['name']).upper().replace('LEFT ','L ').replace('RIGHT ','R ')
        text+=f'        .init(number: {p["number"]}, name: "{p["name"]}", shortName: "{short}", region: .{region}, width: {w:.4f}, height: {h:.4f}, center: CGPoint(x: {cx:.4f}, y: {cy:.4f}), zIndex: {p["z"]}, entry: .{entry}),\n'
    text+='    ]\n}\n'
    (ROOT/'Assembly'/(title+'.swift')).write_text(text)

factory='import SwiftUI\n\nstruct AssemblyRegionView: View {\n    let region: AssemblyRegion\n    @ObservedObject var state: MarkIIIState\n    var body: some View {\n        ZStack {\n            ForEach(MarkIIILayout.parts.filter { $0.region == region }) { part in\n                AssemblyPartView(part: part, visible: state.isVisible(part))\n                    .zIndex(part.zIndex)\n            }\n        }.frame(width: MarkIIILayout.canvas.width, height: MarkIIILayout.canvas.height)\n    }\n}\n\nenum PartViewFactory {\n    @ViewBuilder static func view(for number: Int) -> some View {\n        switch number {\n'
for p in sorted(plates,key=lambda p:p['number']): factory+=f'        case {p["number"]}: {p["name"]}()\n'
factory+='        default: EmptyView()\n        }\n    }\n}\n'
(ROOT/'Assembly'/'AssemblyRegionView.swift').write_text(factory)
print(f'Generated {len(plates)} registered vector components.')
