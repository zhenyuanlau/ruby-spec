# frozen_string_literal: true

RSpec.describe '语言' do
  context '基底' do
    context '表示' do
      context '立即值' do
        example '常量' do
          A = 'A'
          expect(A).to eq 'A'
        end

        example '个别对象' do
          one = 1
          expect(one).to eq 1
        end
      end

      context '引用' do
        example '对象' do
          o = Object.new
          expect(o).to eq o
        end
      end

      context '操作' do
        context '运算' do
          example '赋值运算' do
            a = 1
            b = 2
            expect([a, b]).to eq [1, 2]
            a, b = b, a
            expect([a, b]).to eq [2, 1]
          end

          example '算术运算' do
            expect(1 + 1).to eq 2
          end

          example '逻辑运算' do
            expect(1 && 1).to eq 1
            expect(1 || 0).to eq 1
            expect(!nil).to eq true
            expect(!0).to eq false
          end

          example '关系运算' do
            expect(1 < 2).to eq true
          end

          example '条件运算' do
            expect(0 ? true : false).to eq true
          end

          example '范围运算' do
            expect(1...5).to eq Range.new(1, 5, true)
          end

          example '下标运算' do
            a = (1..5).to_a
            expect(a[0]).to eq a.first
          end
        end
      end
    end

    context '构造' do
      example '字面量' do
        h = {}
        a = []
        s = ''
        expect(h).to eq({})
        expect(a).to eq []
        expect(s).to eq String.new
      end

      context '变量' do
        example '全局变量' do
        end

        example '本地变量' do
          n = 42
          expect(n).to eq 42
        end

        example '实例变量' do
          C = Class.new
          C.class_eval do
            attr_accessor :v

            def initialize(v)
              @v = v
            end
          end
          o = C.new('v')
          expect(o.v).to eq 'v'
        end

        context '类变量' do
          # klass = Class.new
          # klass.class_eval do
          #   @@v = "v"
          # end
        end

        context '特殊变量' do
          example '伪变量' do
            expect(nil).to eq nil
            expect(false).to eq false
            expect(true).to eq true
            expect(self).to eq self
          end

          example '预定义变量' do
          end
        end
      end

      example '函数' do
        func = lambda do |x, y|
          x + y
        end
        expect(func.call(1, 2)).to eq 3
      end
    end

    context '解释' do
      example '求值' do
        x = 1
        y = 2
        func = ->(x, y) { x + y }
        expect(eval('func.call(x, y)')).to eq 3
      end
    end
  end

  context '抽象' do
    context '数据抽象' do
      context '对象' do
        example '实例' do
          obj = Object.new
          expect(obj.class).to eq Object
          expect(obj.instance_variables).to eq []
        end

        example '类' do
          klass = Class.new
          expect(klass.class).to eq Class
          expect(klass.superclass).to eq Object
          expect(klass.instance_methods(false)).to eq []
          # expect(klass.singleton_class).to eq ?
        end

        example '模块' do
          M = Module.new
          K = Class.new
          M.module_eval do
            def m
              'M#m'
            end
          end
          K.class_eval do
            include M
          end

          o = K.new

          expect(o.m).to eq 'M#m'
        end

        context '可调用对象' do
          context '方法' do
          end

          context '代码块' do
          end
        end

        context '可运行对象' do
          example '进程' do
          end

          example '线程' do
          end

          example '协程' do
          end
        end
      end
    end

    context '过程抽象' do
      example '方法' do
      end

      example '代码块' do
      end
    end

    context '控制抽象' do
      example '分支' do
      end

      example '循环' do
      end

      example '异常处理' do
      end

      example '消息发送' do
      end
    end
  end

  context '组合' do
    context '关系' do
      example '继承' do
      end

      context '混入' do
        example 'included' do
        end
        example 'prepend' do
        end

        example 'refine' do
        end
      end
    end

    context '扩展' do
      example '加载' do
      end
    end
  end
end
