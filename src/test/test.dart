import 'package:test/test.dart';
import 'package:sinon/sinon.dart';
import 'package:prompt_sync/prompt_sync.dart' as promptSync;
import 'package:module.dart' as myModule;
import 'package:riceCooker.dart' as riceCooker;

void main() {
  late SinonSpy consoleLogSpy;
  late SinonStub promptStub;

  setUp(() {
    consoleLogSpy = sinon.spy(console, 'log');
    promptStub = sinon.stub(promptSync, 'prompt');
  });

  tearDown(() {
    consoleLogSpy.restore();
    promptStub.restore();
  });

  setUpAll(() {
    consoleLogSpy.resetHistory();
    promptStub.reset();
  });

  test('should branch the rice cooker', () {
    promptStub.returns('1');
    final riceCooker.RiceCooker riceCooker = riceCooker.RiceCooker();
    riceCooker.run();
    sinon.assert.calledWith(consoleLogSpy, '\nRice Cooker branché\n');
    expect(riceCooker.isPlugged).toBeTrue();
  });

  test('should put rice in the rice cooker', () {
    promptStub.returns('2');
    final riceCooker.RiceCooker riceCooker = riceCooker.RiceCooker();
    riceCooker.run();
    sinon.assert.calledWith(consoleLogSpy, '\nRice Cooker prêt!\n');
    expect(riceCooker.isEmpty).toBeFalse();
  });

  test('should switch on the rice cooker', () {
    promptStub.returns('3');
    final riceCooker.RiceCooker riceCooker = riceCooker.RiceCooker();
    riceCooker.run();
    sinon.assert.calledWith(consoleLogSpy, '\nRice Cooker allumé!\n');
    expect(riceCooker.isCooking).toBeTrue();
  });

  test('should switch off the rice cooker', () {
    promptStub.returns('4');
    final riceCooker.RiceCooker riceCooker = riceCooker.RiceCooker();
    riceCooker.run();
    sinon.assert.calledWith(consoleLogSpy, '\nRice Cooker éteint!\n');
    expect(riceCooker.isCooking).toBeFalse();
  });

  test('should empty the rice cooker', () {
    promptStub.returns('5');
    final riceCooker.RiceCooker riceCooker = riceCooker.RiceCooker();
    riceCooker.run();
    sinon.assert.calledWith(consoleLogSpy, '\nVotre rice cooker est vide, mettez quelque chose à cuire !\n');
    expect(riceCooker.isEmpty).toBeTrue();
  });

  test('should unplug the rice cooker', () {
    promptStub.returns('6');
    final riceCooker.RiceCooker riceCooker = riceCooker.RiceCooker();
    riceCooker.run();
    sinon.assert.calledWith(consoleLogSpy, '\nRice Cooker débranché!\n');
    expect(riceCooker.isPlugged).toBeFalse();
  });

  test('should quit the program', () {
    promptStub.returns('7');
    final riceCooker.RiceCooker riceCooker = riceCooker.RiceCooker();
    riceCooker.run();
    sinon.assert.calledWith(consoleLogSpy, 'Au revoir !');
  });
}